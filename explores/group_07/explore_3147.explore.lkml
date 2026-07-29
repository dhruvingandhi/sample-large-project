# Explore: explore_3147
# Auto-generated LookML Explore File

include: "/views/domain_42/view_09442.view.lkml"
include: "/views/domain_44/view_09444.view.lkml"
include: "/views/domain_45/view_09445.view.lkml"
include: "/views/domain_46/view_09446.view.lkml"

explore: explore_3147 {
  label: "Explore Explore 3147"
  description: "Comprehensive analytics explore joining base view_09442 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09442
  
  always_filter: {
    filters: [view_09442.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09442.created_at_date: "7 days"]
    unless: [view_09442.id, view_09442.status]
  }

  join: view_09444 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09442.user_id} = ${view_09444.id} ;;
    required_joins: []
  }

  join: view_09445 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09442.account_id} = ${view_09445.account_id} ;;
    required_joins: [view_09444]
  }

  join: view_09446 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09442.category} = ${view_09446.category} ;;
  }

  access_filter: {
    field: view_09442.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09442.is_deleted} = false ;;
}
