# Explore: explore_3681
# Auto-generated LookML Explore File

include: "/views/domain_44/view_11044.view.lkml"
include: "/views/domain_46/view_11046.view.lkml"
include: "/views/domain_47/view_11047.view.lkml"
include: "/views/domain_48/view_11048.view.lkml"

explore: explore_3681 {
  label: "Explore Explore 3681"
  description: "Comprehensive analytics explore joining base view_11044 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11044
  
  always_filter: {
    filters: [view_11044.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11044.created_at_date: "7 days"]
    unless: [view_11044.id, view_11044.status]
  }

  join: view_11046 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11044.user_id} = ${view_11046.id} ;;
    required_joins: []
  }

  join: view_11047 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11044.account_id} = ${view_11047.account_id} ;;
    required_joins: [view_11046]
  }

  join: view_11048 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11044.category} = ${view_11048.category} ;;
  }

  access_filter: {
    field: view_11044.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11044.is_deleted} = false ;;
}
