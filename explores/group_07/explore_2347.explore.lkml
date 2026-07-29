# Explore: explore_2347
# Auto-generated LookML Explore File

include: "/views/domain_42/view_07042.view.lkml"
include: "/views/domain_44/view_07044.view.lkml"
include: "/views/domain_45/view_07045.view.lkml"
include: "/views/domain_46/view_07046.view.lkml"

explore: explore_2347 {
  label: "Explore Explore 2347"
  description: "Comprehensive analytics explore joining base view_07042 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07042
  
  always_filter: {
    filters: [view_07042.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07042.created_at_date: "7 days"]
    unless: [view_07042.id, view_07042.status]
  }

  join: view_07044 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07042.user_id} = ${view_07044.id} ;;
    required_joins: []
  }

  join: view_07045 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07042.account_id} = ${view_07045.account_id} ;;
    required_joins: [view_07044]
  }

  join: view_07046 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07042.category} = ${view_07046.category} ;;
  }

  access_filter: {
    field: view_07042.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07042.is_deleted} = false ;;
}
