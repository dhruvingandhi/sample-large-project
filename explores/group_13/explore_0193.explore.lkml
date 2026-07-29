# Explore: explore_0193
# Auto-generated LookML Explore File

include: "/views/domain_30/view_00580.view.lkml"
include: "/views/domain_32/view_00582.view.lkml"
include: "/views/domain_33/view_00583.view.lkml"
include: "/views/domain_34/view_00584.view.lkml"

explore: explore_0193 {
  label: "Explore Explore 0193"
  description: "Comprehensive analytics explore joining base view_00580 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_00580
  
  always_filter: {
    filters: [view_00580.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00580.created_at_date: "7 days"]
    unless: [view_00580.id, view_00580.status]
  }

  join: view_00582 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00580.user_id} = ${view_00582.id} ;;
    required_joins: []
  }

  join: view_00583 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00580.account_id} = ${view_00583.account_id} ;;
    required_joins: [view_00582]
  }

  join: view_00584 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00580.category} = ${view_00584.category} ;;
  }

  access_filter: {
    field: view_00580.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00580.is_deleted} = false ;;
}
