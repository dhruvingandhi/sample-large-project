# Explore: explore_0347
# Auto-generated LookML Explore File

include: "/views/domain_42/view_01042.view.lkml"
include: "/views/domain_44/view_01044.view.lkml"
include: "/views/domain_45/view_01045.view.lkml"
include: "/views/domain_46/view_01046.view.lkml"

explore: explore_0347 {
  label: "Explore Explore 0347"
  description: "Comprehensive analytics explore joining base view_01042 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_01042
  
  always_filter: {
    filters: [view_01042.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01042.created_at_date: "7 days"]
    unless: [view_01042.id, view_01042.status]
  }

  join: view_01044 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01042.user_id} = ${view_01044.id} ;;
    required_joins: []
  }

  join: view_01045 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01042.account_id} = ${view_01045.account_id} ;;
    required_joins: [view_01044]
  }

  join: view_01046 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01042.category} = ${view_01046.category} ;;
  }

  access_filter: {
    field: view_01042.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01042.is_deleted} = false ;;
}
