# Explore: explore_0147
# Auto-generated LookML Explore File

include: "/views/domain_42/view_00442.view.lkml"
include: "/views/domain_44/view_00444.view.lkml"
include: "/views/domain_45/view_00445.view.lkml"
include: "/views/domain_46/view_00446.view.lkml"

explore: explore_0147 {
  label: "Explore Explore 0147"
  description: "Comprehensive analytics explore joining base view_00442 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00442
  
  always_filter: {
    filters: [view_00442.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00442.created_at_date: "7 days"]
    unless: [view_00442.id, view_00442.status]
  }

  join: view_00444 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00442.user_id} = ${view_00444.id} ;;
    required_joins: []
  }

  join: view_00445 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00442.account_id} = ${view_00445.account_id} ;;
    required_joins: [view_00444]
  }

  join: view_00446 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00442.category} = ${view_00446.category} ;;
  }

  access_filter: {
    field: view_00442.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00442.is_deleted} = false ;;
}
