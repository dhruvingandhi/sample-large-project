# Explore: explore_0240
# Auto-generated LookML Explore File

include: "/views/domain_21/view_00721.view.lkml"
include: "/views/domain_23/view_00723.view.lkml"
include: "/views/domain_24/view_00724.view.lkml"
include: "/views/domain_25/view_00725.view.lkml"

explore: explore_0240 {
  label: "Explore Explore 0240"
  description: "Comprehensive analytics explore joining base view_00721 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_00721
  
  always_filter: {
    filters: [view_00721.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00721.created_at_date: "7 days"]
    unless: [view_00721.id, view_00721.status]
  }

  join: view_00723 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00721.user_id} = ${view_00723.id} ;;
    required_joins: []
  }

  join: view_00724 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00721.account_id} = ${view_00724.account_id} ;;
    required_joins: [view_00723]
  }

  join: view_00725 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00721.category} = ${view_00725.category} ;;
  }

  access_filter: {
    field: view_00721.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00721.is_deleted} = false ;;
}
