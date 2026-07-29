# Explore: explore_0603
# Auto-generated LookML Explore File

include: "/views/domain_10/view_01810.view.lkml"
include: "/views/domain_12/view_01812.view.lkml"
include: "/views/domain_13/view_01813.view.lkml"
include: "/views/domain_14/view_01814.view.lkml"

explore: explore_0603 {
  label: "Explore Explore 0603"
  description: "Comprehensive analytics explore joining base view_01810 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01810
  
  always_filter: {
    filters: [view_01810.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01810.created_at_date: "7 days"]
    unless: [view_01810.id, view_01810.status]
  }

  join: view_01812 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01810.user_id} = ${view_01812.id} ;;
    required_joins: []
  }

  join: view_01813 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01810.account_id} = ${view_01813.account_id} ;;
    required_joins: [view_01812]
  }

  join: view_01814 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01810.category} = ${view_01814.category} ;;
  }

  access_filter: {
    field: view_01810.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01810.is_deleted} = false ;;
}
