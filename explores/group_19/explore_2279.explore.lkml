# Explore: explore_2279
# Auto-generated LookML Explore File

include: "/views/domain_38/view_06838.view.lkml"
include: "/views/domain_40/view_06840.view.lkml"
include: "/views/domain_41/view_06841.view.lkml"
include: "/views/domain_42/view_06842.view.lkml"

explore: explore_2279 {
  label: "Explore Explore 2279"
  description: "Comprehensive analytics explore joining base view_06838 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_06838
  
  always_filter: {
    filters: [view_06838.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06838.created_at_date: "7 days"]
    unless: [view_06838.id, view_06838.status]
  }

  join: view_06840 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06838.user_id} = ${view_06840.id} ;;
    required_joins: []
  }

  join: view_06841 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06838.account_id} = ${view_06841.account_id} ;;
    required_joins: [view_06840]
  }

  join: view_06842 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06838.category} = ${view_06842.category} ;;
  }

  access_filter: {
    field: view_06838.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06838.is_deleted} = false ;;
}
