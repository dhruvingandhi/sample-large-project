# Explore: explore_2861
# Auto-generated LookML Explore File

include: "/views/domain_34/view_08584.view.lkml"
include: "/views/domain_36/view_08586.view.lkml"
include: "/views/domain_37/view_08587.view.lkml"
include: "/views/domain_38/view_08588.view.lkml"

explore: explore_2861 {
  label: "Explore Explore 2861"
  description: "Comprehensive analytics explore joining base view_08584 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_08584
  
  always_filter: {
    filters: [view_08584.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08584.created_at_date: "7 days"]
    unless: [view_08584.id, view_08584.status]
  }

  join: view_08586 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08584.user_id} = ${view_08586.id} ;;
    required_joins: []
  }

  join: view_08587 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08584.account_id} = ${view_08587.account_id} ;;
    required_joins: [view_08586]
  }

  join: view_08588 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08584.category} = ${view_08588.category} ;;
  }

  access_filter: {
    field: view_08584.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08584.is_deleted} = false ;;
}
