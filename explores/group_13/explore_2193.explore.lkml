# Explore: explore_2193
# Auto-generated LookML Explore File

include: "/views/domain_30/view_06580.view.lkml"
include: "/views/domain_32/view_06582.view.lkml"
include: "/views/domain_33/view_06583.view.lkml"
include: "/views/domain_34/view_06584.view.lkml"

explore: explore_2193 {
  label: "Explore Explore 2193"
  description: "Comprehensive analytics explore joining base view_06580 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06580
  
  always_filter: {
    filters: [view_06580.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06580.created_at_date: "7 days"]
    unless: [view_06580.id, view_06580.status]
  }

  join: view_06582 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06580.user_id} = ${view_06582.id} ;;
    required_joins: []
  }

  join: view_06583 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06580.account_id} = ${view_06583.account_id} ;;
    required_joins: [view_06582]
  }

  join: view_06584 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06580.category} = ${view_06584.category} ;;
  }

  access_filter: {
    field: view_06580.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06580.is_deleted} = false ;;
}
