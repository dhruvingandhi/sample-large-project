# Explore: explore_1193
# Auto-generated LookML Explore File

include: "/views/domain_30/view_03580.view.lkml"
include: "/views/domain_32/view_03582.view.lkml"
include: "/views/domain_33/view_03583.view.lkml"
include: "/views/domain_34/view_03584.view.lkml"

explore: explore_1193 {
  label: "Explore Explore 1193"
  description: "Comprehensive analytics explore joining base view_03580 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_03580
  
  always_filter: {
    filters: [view_03580.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03580.created_at_date: "7 days"]
    unless: [view_03580.id, view_03580.status]
  }

  join: view_03582 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03580.user_id} = ${view_03582.id} ;;
    required_joins: []
  }

  join: view_03583 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03580.account_id} = ${view_03583.account_id} ;;
    required_joins: [view_03582]
  }

  join: view_03584 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03580.category} = ${view_03584.category} ;;
  }

  access_filter: {
    field: view_03580.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03580.is_deleted} = false ;;
}
