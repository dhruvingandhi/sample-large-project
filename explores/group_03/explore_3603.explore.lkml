# Explore: explore_3603
# Auto-generated LookML Explore File

include: "/views/domain_10/view_10810.view.lkml"
include: "/views/domain_12/view_10812.view.lkml"
include: "/views/domain_13/view_10813.view.lkml"
include: "/views/domain_14/view_10814.view.lkml"

explore: explore_3603 {
  label: "Explore Explore 3603"
  description: "Comprehensive analytics explore joining base view_10810 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10810
  
  always_filter: {
    filters: [view_10810.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10810.created_at_date: "7 days"]
    unless: [view_10810.id, view_10810.status]
  }

  join: view_10812 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10810.user_id} = ${view_10812.id} ;;
    required_joins: []
  }

  join: view_10813 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10810.account_id} = ${view_10813.account_id} ;;
    required_joins: [view_10812]
  }

  join: view_10814 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10810.category} = ${view_10814.category} ;;
  }

  access_filter: {
    field: view_10810.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10810.is_deleted} = false ;;
}
