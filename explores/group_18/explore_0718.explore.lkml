# Update for 2000 file diff target
# Explore: explore_0718
# Auto-generated LookML Explore File

include: "/views/domain_05/view_02155.view.lkml"
include: "/views/domain_07/view_02157.view.lkml"
include: "/views/domain_08/view_02158.view.lkml"
include: "/views/domain_09/view_02159.view.lkml"

explore: explore_0718 {
  label: "Explore Explore 0718"
  description: "Comprehensive analytics explore joining base view_02155 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02155
  
  always_filter: {
    filters: [view_02155.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02155.created_at_date: "7 days"]
    unless: [view_02155.id, view_02155.status]
  }

  join: view_02157 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02155.user_id} = ${view_02157.id} ;;
    required_joins: []
  }

  join: view_02158 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02155.account_id} = ${view_02158.account_id} ;;
    required_joins: [view_02157]
  }

  join: view_02159 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02155.category} = ${view_02159.category} ;;
  }

  access_filter: {
    field: view_02155.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02155.is_deleted} = false ;;
}
