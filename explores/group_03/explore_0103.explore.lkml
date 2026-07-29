# Explore: explore_0103
# Auto-generated LookML Explore File

include: "/views/domain_10/view_00310.view.lkml"
include: "/views/domain_12/view_00312.view.lkml"
include: "/views/domain_13/view_00313.view.lkml"
include: "/views/domain_14/view_00314.view.lkml"

explore: explore_0103 {
  label: "Explore Explore 0103"
  description: "Comprehensive analytics explore joining base view_00310 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00310
  
  always_filter: {
    filters: [view_00310.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00310.created_at_date: "7 days"]
    unless: [view_00310.id, view_00310.status]
  }

  join: view_00312 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00310.user_id} = ${view_00312.id} ;;
    required_joins: []
  }

  join: view_00313 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00310.account_id} = ${view_00313.account_id} ;;
    required_joins: [view_00312]
  }

  join: view_00314 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00310.category} = ${view_00314.category} ;;
  }

  access_filter: {
    field: view_00310.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00310.is_deleted} = false ;;
}
