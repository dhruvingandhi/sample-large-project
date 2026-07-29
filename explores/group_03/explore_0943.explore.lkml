# Explore: explore_0943
# Auto-generated LookML Explore File

include: "/views/domain_30/view_02830.view.lkml"
include: "/views/domain_32/view_02832.view.lkml"
include: "/views/domain_33/view_02833.view.lkml"
include: "/views/domain_34/view_02834.view.lkml"

explore: explore_0943 {
  label: "Explore Explore 0943"
  description: "Comprehensive analytics explore joining base view_02830 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_02830
  
  always_filter: {
    filters: [view_02830.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02830.created_at_date: "7 days"]
    unless: [view_02830.id, view_02830.status]
  }

  join: view_02832 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02830.user_id} = ${view_02832.id} ;;
    required_joins: []
  }

  join: view_02833 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02830.account_id} = ${view_02833.account_id} ;;
    required_joins: [view_02832]
  }

  join: view_02834 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02830.category} = ${view_02834.category} ;;
  }

  access_filter: {
    field: view_02830.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02830.is_deleted} = false ;;
}
