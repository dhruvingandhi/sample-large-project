# Explore: explore_1228
# Auto-generated LookML Explore File

include: "/views/domain_35/view_03685.view.lkml"
include: "/views/domain_37/view_03687.view.lkml"
include: "/views/domain_38/view_03688.view.lkml"
include: "/views/domain_39/view_03689.view.lkml"

explore: explore_1228 {
  label: "Explore Explore 1228"
  description: "Comprehensive analytics explore joining base view_03685 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03685
  
  always_filter: {
    filters: [view_03685.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03685.created_at_date: "7 days"]
    unless: [view_03685.id, view_03685.status]
  }

  join: view_03687 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03685.user_id} = ${view_03687.id} ;;
    required_joins: []
  }

  join: view_03688 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03685.account_id} = ${view_03688.account_id} ;;
    required_joins: [view_03687]
  }

  join: view_03689 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03685.category} = ${view_03689.category} ;;
  }

  access_filter: {
    field: view_03685.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03685.is_deleted} = false ;;
}
