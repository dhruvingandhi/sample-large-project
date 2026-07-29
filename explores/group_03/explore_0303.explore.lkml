# Explore: explore_0303
# Auto-generated LookML Explore File

include: "/views/domain_10/view_00910.view.lkml"
include: "/views/domain_12/view_00912.view.lkml"
include: "/views/domain_13/view_00913.view.lkml"
include: "/views/domain_14/view_00914.view.lkml"

explore: explore_0303 {
  label: "Explore Explore 0303"
  description: "Comprehensive analytics explore joining base view_00910 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00910
  
  always_filter: {
    filters: [view_00910.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00910.created_at_date: "7 days"]
    unless: [view_00910.id, view_00910.status]
  }

  join: view_00912 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00910.user_id} = ${view_00912.id} ;;
    required_joins: []
  }

  join: view_00913 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00910.account_id} = ${view_00913.account_id} ;;
    required_joins: [view_00912]
  }

  join: view_00914 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00910.category} = ${view_00914.category} ;;
  }

  access_filter: {
    field: view_00910.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00910.is_deleted} = false ;;
}
