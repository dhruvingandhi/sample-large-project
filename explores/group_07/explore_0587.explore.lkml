# Explore: explore_0587
# Auto-generated LookML Explore File

include: "/views/domain_12/view_01762.view.lkml"
include: "/views/domain_14/view_01764.view.lkml"
include: "/views/domain_15/view_01765.view.lkml"
include: "/views/domain_16/view_01766.view.lkml"

explore: explore_0587 {
  label: "Explore Explore 0587"
  description: "Comprehensive analytics explore joining base view_01762 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_01762
  
  always_filter: {
    filters: [view_01762.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01762.created_at_date: "7 days"]
    unless: [view_01762.id, view_01762.status]
  }

  join: view_01764 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01762.user_id} = ${view_01764.id} ;;
    required_joins: []
  }

  join: view_01765 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01762.account_id} = ${view_01765.account_id} ;;
    required_joins: [view_01764]
  }

  join: view_01766 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01762.category} = ${view_01766.category} ;;
  }

  access_filter: {
    field: view_01762.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01762.is_deleted} = false ;;
}
