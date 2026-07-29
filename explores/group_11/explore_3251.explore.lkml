# Explore: explore_3251
# Auto-generated LookML Explore File

include: "/views/domain_04/view_09754.view.lkml"
include: "/views/domain_06/view_09756.view.lkml"
include: "/views/domain_07/view_09757.view.lkml"
include: "/views/domain_08/view_09758.view.lkml"

explore: explore_3251 {
  label: "Explore Explore 3251"
  description: "Comprehensive analytics explore joining base view_09754 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_09754
  
  always_filter: {
    filters: [view_09754.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09754.created_at_date: "7 days"]
    unless: [view_09754.id, view_09754.status]
  }

  join: view_09756 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09754.user_id} = ${view_09756.id} ;;
    required_joins: []
  }

  join: view_09757 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09754.account_id} = ${view_09757.account_id} ;;
    required_joins: [view_09756]
  }

  join: view_09758 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09754.category} = ${view_09758.category} ;;
  }

  access_filter: {
    field: view_09754.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09754.is_deleted} = false ;;
}
