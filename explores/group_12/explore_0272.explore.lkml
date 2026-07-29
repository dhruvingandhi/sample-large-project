# Explore: explore_0272
# Auto-generated LookML Explore File

include: "/views/domain_17/view_00817.view.lkml"
include: "/views/domain_19/view_00819.view.lkml"
include: "/views/domain_20/view_00820.view.lkml"
include: "/views/domain_21/view_00821.view.lkml"

explore: explore_0272 {
  label: "Explore Explore 0272"
  description: "Comprehensive analytics explore joining base view_00817 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_00817
  
  always_filter: {
    filters: [view_00817.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00817.created_at_date: "7 days"]
    unless: [view_00817.id, view_00817.status]
  }

  join: view_00819 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00817.user_id} = ${view_00819.id} ;;
    required_joins: []
  }

  join: view_00820 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00817.account_id} = ${view_00820.account_id} ;;
    required_joins: [view_00819]
  }

  join: view_00821 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00817.category} = ${view_00821.category} ;;
  }

  access_filter: {
    field: view_00817.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00817.is_deleted} = false ;;
}
