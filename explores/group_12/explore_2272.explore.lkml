# Explore: explore_2272
# Auto-generated LookML Explore File

include: "/views/domain_17/view_06817.view.lkml"
include: "/views/domain_19/view_06819.view.lkml"
include: "/views/domain_20/view_06820.view.lkml"
include: "/views/domain_21/view_06821.view.lkml"

explore: explore_2272 {
  label: "Explore Explore 2272"
  description: "Comprehensive analytics explore joining base view_06817 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06817
  
  always_filter: {
    filters: [view_06817.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06817.created_at_date: "7 days"]
    unless: [view_06817.id, view_06817.status]
  }

  join: view_06819 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06817.user_id} = ${view_06819.id} ;;
    required_joins: []
  }

  join: view_06820 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06817.account_id} = ${view_06820.account_id} ;;
    required_joins: [view_06819]
  }

  join: view_06821 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06817.category} = ${view_06821.category} ;;
  }

  access_filter: {
    field: view_06817.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06817.is_deleted} = false ;;
}
