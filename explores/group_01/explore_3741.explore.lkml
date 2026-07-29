# Explore: explore_3741
# Auto-generated LookML Explore File

include: "/views/domain_24/view_11224.view.lkml"
include: "/views/domain_26/view_11226.view.lkml"
include: "/views/domain_27/view_11227.view.lkml"
include: "/views/domain_28/view_11228.view.lkml"

explore: explore_3741 {
  label: "Explore Explore 3741"
  description: "Comprehensive analytics explore joining base view_11224 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11224
  
  always_filter: {
    filters: [view_11224.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11224.created_at_date: "7 days"]
    unless: [view_11224.id, view_11224.status]
  }

  join: view_11226 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11224.user_id} = ${view_11226.id} ;;
    required_joins: []
  }

  join: view_11227 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11224.account_id} = ${view_11227.account_id} ;;
    required_joins: [view_11226]
  }

  join: view_11228 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11224.category} = ${view_11228.category} ;;
  }

  access_filter: {
    field: view_11224.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11224.is_deleted} = false ;;
}
