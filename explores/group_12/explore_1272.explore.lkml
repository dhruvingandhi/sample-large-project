# Explore: explore_1272
# Auto-generated LookML Explore File

include: "/views/domain_17/view_03817.view.lkml"
include: "/views/domain_19/view_03819.view.lkml"
include: "/views/domain_20/view_03820.view.lkml"
include: "/views/domain_21/view_03821.view.lkml"

explore: explore_1272 {
  label: "Explore Explore 1272"
  description: "Comprehensive analytics explore joining base view_03817 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03817
  
  always_filter: {
    filters: [view_03817.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03817.created_at_date: "7 days"]
    unless: [view_03817.id, view_03817.status]
  }

  join: view_03819 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03817.user_id} = ${view_03819.id} ;;
    required_joins: []
  }

  join: view_03820 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03817.account_id} = ${view_03820.account_id} ;;
    required_joins: [view_03819]
  }

  join: view_03821 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03817.category} = ${view_03821.category} ;;
  }

  access_filter: {
    field: view_03817.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03817.is_deleted} = false ;;
}
