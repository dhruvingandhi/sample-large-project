# Explore: explore_3240
# Auto-generated LookML Explore File

include: "/views/domain_21/view_09721.view.lkml"
include: "/views/domain_23/view_09723.view.lkml"
include: "/views/domain_24/view_09724.view.lkml"
include: "/views/domain_25/view_09725.view.lkml"

explore: explore_3240 {
  label: "Explore Explore 3240"
  description: "Comprehensive analytics explore joining base view_09721 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09721
  
  always_filter: {
    filters: [view_09721.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09721.created_at_date: "7 days"]
    unless: [view_09721.id, view_09721.status]
  }

  join: view_09723 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09721.user_id} = ${view_09723.id} ;;
    required_joins: []
  }

  join: view_09724 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09721.account_id} = ${view_09724.account_id} ;;
    required_joins: [view_09723]
  }

  join: view_09725 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09721.category} = ${view_09725.category} ;;
  }

  access_filter: {
    field: view_09721.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09721.is_deleted} = false ;;
}
