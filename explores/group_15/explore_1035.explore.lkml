# Explore: explore_1035
# Auto-generated LookML Explore File

include: "/views/domain_06/view_03106.view.lkml"
include: "/views/domain_08/view_03108.view.lkml"
include: "/views/domain_09/view_03109.view.lkml"
include: "/views/domain_10/view_03110.view.lkml"

explore: explore_1035 {
  label: "Explore Explore 1035"
  description: "Comprehensive analytics explore joining base view_03106 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03106
  
  always_filter: {
    filters: [view_03106.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03106.created_at_date: "7 days"]
    unless: [view_03106.id, view_03106.status]
  }

  join: view_03108 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03106.user_id} = ${view_03108.id} ;;
    required_joins: []
  }

  join: view_03109 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03106.account_id} = ${view_03109.account_id} ;;
    required_joins: [view_03108]
  }

  join: view_03110 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03106.category} = ${view_03110.category} ;;
  }

  access_filter: {
    field: view_03106.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03106.is_deleted} = false ;;
}
