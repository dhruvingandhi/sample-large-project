# Explore: explore_3197
# Auto-generated LookML Explore File

include: "/views/domain_42/view_09592.view.lkml"
include: "/views/domain_44/view_09594.view.lkml"
include: "/views/domain_45/view_09595.view.lkml"
include: "/views/domain_46/view_09596.view.lkml"

explore: explore_3197 {
  label: "Explore Explore 3197"
  description: "Comprehensive analytics explore joining base view_09592 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09592
  
  always_filter: {
    filters: [view_09592.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09592.created_at_date: "7 days"]
    unless: [view_09592.id, view_09592.status]
  }

  join: view_09594 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09592.user_id} = ${view_09594.id} ;;
    required_joins: []
  }

  join: view_09595 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09592.account_id} = ${view_09595.account_id} ;;
    required_joins: [view_09594]
  }

  join: view_09596 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09592.category} = ${view_09596.category} ;;
  }

  access_filter: {
    field: view_09592.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09592.is_deleted} = false ;;
}
