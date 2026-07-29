# Explore: explore_0527
# Auto-generated LookML Explore File

include: "/views/domain_32/view_01582.view.lkml"
include: "/views/domain_34/view_01584.view.lkml"
include: "/views/domain_35/view_01585.view.lkml"
include: "/views/domain_36/view_01586.view.lkml"

explore: explore_0527 {
  label: "Explore Explore 0527"
  description: "Comprehensive analytics explore joining base view_01582 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_01582
  
  always_filter: {
    filters: [view_01582.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01582.created_at_date: "7 days"]
    unless: [view_01582.id, view_01582.status]
  }

  join: view_01584 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01582.user_id} = ${view_01584.id} ;;
    required_joins: []
  }

  join: view_01585 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01582.account_id} = ${view_01585.account_id} ;;
    required_joins: [view_01584]
  }

  join: view_01586 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01582.category} = ${view_01586.category} ;;
  }

  access_filter: {
    field: view_01582.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01582.is_deleted} = false ;;
}
