# Update for 2000 file diff target
# Explore: explore_0938
# Auto-generated LookML Explore File

include: "/views/domain_15/view_02815.view.lkml"
include: "/views/domain_17/view_02817.view.lkml"
include: "/views/domain_18/view_02818.view.lkml"
include: "/views/domain_19/view_02819.view.lkml"

explore: explore_0938 {
  label: "Explore Explore 0938"
  description: "Comprehensive analytics explore joining base view_02815 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02815
  
  always_filter: {
    filters: [view_02815.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02815.created_at_date: "7 days"]
    unless: [view_02815.id, view_02815.status]
  }

  join: view_02817 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02815.user_id} = ${view_02817.id} ;;
    required_joins: []
  }

  join: view_02818 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02815.account_id} = ${view_02818.account_id} ;;
    required_joins: [view_02817]
  }

  join: view_02819 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02815.category} = ${view_02819.category} ;;
  }

  access_filter: {
    field: view_02815.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02815.is_deleted} = false ;;
}
