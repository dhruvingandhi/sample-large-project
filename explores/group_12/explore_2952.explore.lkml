# Explore: explore_2952
# Auto-generated LookML Explore File

include: "/views/domain_07/view_08857.view.lkml"
include: "/views/domain_09/view_08859.view.lkml"
include: "/views/domain_10/view_08860.view.lkml"
include: "/views/domain_11/view_08861.view.lkml"

explore: explore_2952 {
  label: "Explore Explore 2952"
  description: "Comprehensive analytics explore joining base view_08857 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08857
  
  always_filter: {
    filters: [view_08857.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08857.created_at_date: "7 days"]
    unless: [view_08857.id, view_08857.status]
  }

  join: view_08859 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08857.user_id} = ${view_08859.id} ;;
    required_joins: []
  }

  join: view_08860 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08857.account_id} = ${view_08860.account_id} ;;
    required_joins: [view_08859]
  }

  join: view_08861 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08857.category} = ${view_08861.category} ;;
  }

  access_filter: {
    field: view_08857.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08857.is_deleted} = false ;;
}
