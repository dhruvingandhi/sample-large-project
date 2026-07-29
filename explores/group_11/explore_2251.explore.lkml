# Explore: explore_2251
# Auto-generated LookML Explore File

include: "/views/domain_04/view_06754.view.lkml"
include: "/views/domain_06/view_06756.view.lkml"
include: "/views/domain_07/view_06757.view.lkml"
include: "/views/domain_08/view_06758.view.lkml"

explore: explore_2251 {
  label: "Explore Explore 2251"
  description: "Comprehensive analytics explore joining base view_06754 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06754
  
  always_filter: {
    filters: [view_06754.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06754.created_at_date: "7 days"]
    unless: [view_06754.id, view_06754.status]
  }

  join: view_06756 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06754.user_id} = ${view_06756.id} ;;
    required_joins: []
  }

  join: view_06757 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06754.account_id} = ${view_06757.account_id} ;;
    required_joins: [view_06756]
  }

  join: view_06758 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06754.category} = ${view_06758.category} ;;
  }

  access_filter: {
    field: view_06754.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06754.is_deleted} = false ;;
}
