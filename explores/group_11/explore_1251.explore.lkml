# Explore: explore_1251
# Auto-generated LookML Explore File

include: "/views/domain_04/view_03754.view.lkml"
include: "/views/domain_06/view_03756.view.lkml"
include: "/views/domain_07/view_03757.view.lkml"
include: "/views/domain_08/view_03758.view.lkml"

explore: explore_1251 {
  label: "Explore Explore 1251"
  description: "Comprehensive analytics explore joining base view_03754 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03754
  
  always_filter: {
    filters: [view_03754.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03754.created_at_date: "7 days"]
    unless: [view_03754.id, view_03754.status]
  }

  join: view_03756 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03754.user_id} = ${view_03756.id} ;;
    required_joins: []
  }

  join: view_03757 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03754.account_id} = ${view_03757.account_id} ;;
    required_joins: [view_03756]
  }

  join: view_03758 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03754.category} = ${view_03758.category} ;;
  }

  access_filter: {
    field: view_03754.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03754.is_deleted} = false ;;
}
