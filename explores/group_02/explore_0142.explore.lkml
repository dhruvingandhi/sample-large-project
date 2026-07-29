# Explore: explore_0142
# Auto-generated LookML Explore File

include: "/views/domain_27/view_00427.view.lkml"
include: "/views/domain_29/view_00429.view.lkml"
include: "/views/domain_30/view_00430.view.lkml"
include: "/views/domain_31/view_00431.view.lkml"

explore: explore_0142 {
  label: "Explore Explore 0142"
  description: "Comprehensive analytics explore joining base view_00427 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_00427
  
  always_filter: {
    filters: [view_00427.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00427.created_at_date: "7 days"]
    unless: [view_00427.id, view_00427.status]
  }

  join: view_00429 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00427.user_id} = ${view_00429.id} ;;
    required_joins: []
  }

  join: view_00430 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00427.account_id} = ${view_00430.account_id} ;;
    required_joins: [view_00429]
  }

  join: view_00431 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00427.category} = ${view_00431.category} ;;
  }

  access_filter: {
    field: view_00427.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00427.is_deleted} = false ;;
}
