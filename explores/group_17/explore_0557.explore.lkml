# Update for 2000 file diff target
# Explore: explore_0557
# Auto-generated LookML Explore File

include: "/views/domain_22/view_01672.view.lkml"
include: "/views/domain_24/view_01674.view.lkml"
include: "/views/domain_25/view_01675.view.lkml"
include: "/views/domain_26/view_01676.view.lkml"

explore: explore_0557 {
  label: "Explore Explore 0557"
  description: "Comprehensive analytics explore joining base view_01672 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01672
  
  always_filter: {
    filters: [view_01672.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01672.created_at_date: "7 days"]
    unless: [view_01672.id, view_01672.status]
  }

  join: view_01674 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01672.user_id} = ${view_01674.id} ;;
    required_joins: []
  }

  join: view_01675 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01672.account_id} = ${view_01675.account_id} ;;
    required_joins: [view_01674]
  }

  join: view_01676 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01672.category} = ${view_01676.category} ;;
  }

  access_filter: {
    field: view_01672.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01672.is_deleted} = false ;;
}
