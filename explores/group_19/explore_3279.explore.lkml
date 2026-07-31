# Update for 2000 file diff target
# Explore: explore_3279
# Auto-generated LookML Explore File

include: "/views/domain_38/view_09838.view.lkml"
include: "/views/domain_40/view_09840.view.lkml"
include: "/views/domain_41/view_09841.view.lkml"
include: "/views/domain_42/view_09842.view.lkml"

explore: explore_3279 {
  label: "Explore Explore 3279"
  description: "Comprehensive analytics explore joining base view_09838 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09838
  
  always_filter: {
    filters: [view_09838.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09838.created_at_date: "7 days"]
    unless: [view_09838.id, view_09838.status]
  }

  join: view_09840 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09838.user_id} = ${view_09840.id} ;;
    required_joins: []
  }

  join: view_09841 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09838.account_id} = ${view_09841.account_id} ;;
    required_joins: [view_09840]
  }

  join: view_09842 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09838.category} = ${view_09842.category} ;;
  }

  access_filter: {
    field: view_09838.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09838.is_deleted} = false ;;
}
