# Explore: explore_1603
# Auto-generated LookML Explore File

include: "/views/domain_10/view_04810.view.lkml"
include: "/views/domain_12/view_04812.view.lkml"
include: "/views/domain_13/view_04813.view.lkml"
include: "/views/domain_14/view_04814.view.lkml"

explore: explore_1603 {
  label: "Explore Explore 1603"
  description: "Comprehensive analytics explore joining base view_04810 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_04810
  
  always_filter: {
    filters: [view_04810.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04810.created_at_date: "7 days"]
    unless: [view_04810.id, view_04810.status]
  }

  join: view_04812 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04810.user_id} = ${view_04812.id} ;;
    required_joins: []
  }

  join: view_04813 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04810.account_id} = ${view_04813.account_id} ;;
    required_joins: [view_04812]
  }

  join: view_04814 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04810.category} = ${view_04814.category} ;;
  }

  access_filter: {
    field: view_04810.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04810.is_deleted} = false ;;
}
