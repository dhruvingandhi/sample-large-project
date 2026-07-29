# Explore: explore_2881
# Auto-generated LookML Explore File

include: "/views/domain_44/view_08644.view.lkml"
include: "/views/domain_46/view_08646.view.lkml"
include: "/views/domain_47/view_08647.view.lkml"
include: "/views/domain_48/view_08648.view.lkml"

explore: explore_2881 {
  label: "Explore Explore 2881"
  description: "Comprehensive analytics explore joining base view_08644 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_08644
  
  always_filter: {
    filters: [view_08644.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08644.created_at_date: "7 days"]
    unless: [view_08644.id, view_08644.status]
  }

  join: view_08646 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08644.user_id} = ${view_08646.id} ;;
    required_joins: []
  }

  join: view_08647 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08644.account_id} = ${view_08647.account_id} ;;
    required_joins: [view_08646]
  }

  join: view_08648 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08644.category} = ${view_08648.category} ;;
  }

  access_filter: {
    field: view_08644.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08644.is_deleted} = false ;;
}
