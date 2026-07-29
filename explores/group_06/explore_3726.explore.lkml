# Explore: explore_3726
# Auto-generated LookML Explore File

include: "/views/domain_29/view_11179.view.lkml"
include: "/views/domain_31/view_11181.view.lkml"
include: "/views/domain_32/view_11182.view.lkml"
include: "/views/domain_33/view_11183.view.lkml"

explore: explore_3726 {
  label: "Explore Explore 3726"
  description: "Comprehensive analytics explore joining base view_11179 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11179
  
  always_filter: {
    filters: [view_11179.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11179.created_at_date: "7 days"]
    unless: [view_11179.id, view_11179.status]
  }

  join: view_11181 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11179.user_id} = ${view_11181.id} ;;
    required_joins: []
  }

  join: view_11182 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11179.account_id} = ${view_11182.account_id} ;;
    required_joins: [view_11181]
  }

  join: view_11183 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11179.category} = ${view_11183.category} ;;
  }

  access_filter: {
    field: view_11179.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11179.is_deleted} = false ;;
}
