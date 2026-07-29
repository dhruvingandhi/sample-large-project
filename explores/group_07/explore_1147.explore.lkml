# Explore: explore_1147
# Auto-generated LookML Explore File

include: "/views/domain_42/view_03442.view.lkml"
include: "/views/domain_44/view_03444.view.lkml"
include: "/views/domain_45/view_03445.view.lkml"
include: "/views/domain_46/view_03446.view.lkml"

explore: explore_1147 {
  label: "Explore Explore 1147"
  description: "Comprehensive analytics explore joining base view_03442 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03442
  
  always_filter: {
    filters: [view_03442.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03442.created_at_date: "7 days"]
    unless: [view_03442.id, view_03442.status]
  }

  join: view_03444 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03442.user_id} = ${view_03444.id} ;;
    required_joins: []
  }

  join: view_03445 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03442.account_id} = ${view_03445.account_id} ;;
    required_joins: [view_03444]
  }

  join: view_03446 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03442.category} = ${view_03446.category} ;;
  }

  access_filter: {
    field: view_03442.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03442.is_deleted} = false ;;
}
