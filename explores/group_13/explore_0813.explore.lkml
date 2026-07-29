# Explore: explore_0813
# Auto-generated LookML Explore File

include: "/views/domain_40/view_02440.view.lkml"
include: "/views/domain_42/view_02442.view.lkml"
include: "/views/domain_43/view_02443.view.lkml"
include: "/views/domain_44/view_02444.view.lkml"

explore: explore_0813 {
  label: "Explore Explore 0813"
  description: "Comprehensive analytics explore joining base view_02440 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02440
  
  always_filter: {
    filters: [view_02440.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02440.created_at_date: "7 days"]
    unless: [view_02440.id, view_02440.status]
  }

  join: view_02442 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02440.user_id} = ${view_02442.id} ;;
    required_joins: []
  }

  join: view_02443 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02440.account_id} = ${view_02443.account_id} ;;
    required_joins: [view_02442]
  }

  join: view_02444 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02440.category} = ${view_02444.category} ;;
  }

  access_filter: {
    field: view_02440.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02440.is_deleted} = false ;;
}
