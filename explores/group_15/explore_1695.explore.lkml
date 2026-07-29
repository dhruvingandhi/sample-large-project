# Explore: explore_1695
# Auto-generated LookML Explore File

include: "/views/domain_36/view_05086.view.lkml"
include: "/views/domain_38/view_05088.view.lkml"
include: "/views/domain_39/view_05089.view.lkml"
include: "/views/domain_40/view_05090.view.lkml"

explore: explore_1695 {
  label: "Explore Explore 1695"
  description: "Comprehensive analytics explore joining base view_05086 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05086
  
  always_filter: {
    filters: [view_05086.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05086.created_at_date: "7 days"]
    unless: [view_05086.id, view_05086.status]
  }

  join: view_05088 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05086.user_id} = ${view_05088.id} ;;
    required_joins: []
  }

  join: view_05089 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05086.account_id} = ${view_05089.account_id} ;;
    required_joins: [view_05088]
  }

  join: view_05090 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05086.category} = ${view_05090.category} ;;
  }

  access_filter: {
    field: view_05086.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05086.is_deleted} = false ;;
}
