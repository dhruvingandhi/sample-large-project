# Explore: explore_2147
# Auto-generated LookML Explore File

include: "/views/domain_42/view_06442.view.lkml"
include: "/views/domain_44/view_06444.view.lkml"
include: "/views/domain_45/view_06445.view.lkml"
include: "/views/domain_46/view_06446.view.lkml"

explore: explore_2147 {
  label: "Explore Explore 2147"
  description: "Comprehensive analytics explore joining base view_06442 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06442
  
  always_filter: {
    filters: [view_06442.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06442.created_at_date: "7 days"]
    unless: [view_06442.id, view_06442.status]
  }

  join: view_06444 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06442.user_id} = ${view_06444.id} ;;
    required_joins: []
  }

  join: view_06445 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06442.account_id} = ${view_06445.account_id} ;;
    required_joins: [view_06444]
  }

  join: view_06446 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06442.category} = ${view_06446.category} ;;
  }

  access_filter: {
    field: view_06442.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06442.is_deleted} = false ;;
}
