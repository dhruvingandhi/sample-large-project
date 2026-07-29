# Explore: explore_1279
# Auto-generated LookML Explore File

include: "/views/domain_38/view_03838.view.lkml"
include: "/views/domain_40/view_03840.view.lkml"
include: "/views/domain_41/view_03841.view.lkml"
include: "/views/domain_42/view_03842.view.lkml"

explore: explore_1279 {
  label: "Explore Explore 1279"
  description: "Comprehensive analytics explore joining base view_03838 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03838
  
  always_filter: {
    filters: [view_03838.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03838.created_at_date: "7 days"]
    unless: [view_03838.id, view_03838.status]
  }

  join: view_03840 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03838.user_id} = ${view_03840.id} ;;
    required_joins: []
  }

  join: view_03841 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03838.account_id} = ${view_03841.account_id} ;;
    required_joins: [view_03840]
  }

  join: view_03842 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03838.category} = ${view_03842.category} ;;
  }

  access_filter: {
    field: view_03838.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03838.is_deleted} = false ;;
}
