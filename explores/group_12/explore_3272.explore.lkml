# Explore: explore_3272
# Auto-generated LookML Explore File

include: "/views/domain_17/view_09817.view.lkml"
include: "/views/domain_19/view_09819.view.lkml"
include: "/views/domain_20/view_09820.view.lkml"
include: "/views/domain_21/view_09821.view.lkml"

explore: explore_3272 {
  label: "Explore Explore 3272"
  description: "Comprehensive analytics explore joining base view_09817 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_09817
  
  always_filter: {
    filters: [view_09817.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09817.created_at_date: "7 days"]
    unless: [view_09817.id, view_09817.status]
  }

  join: view_09819 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09817.user_id} = ${view_09819.id} ;;
    required_joins: []
  }

  join: view_09820 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09817.account_id} = ${view_09820.account_id} ;;
    required_joins: [view_09819]
  }

  join: view_09821 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09817.category} = ${view_09821.category} ;;
  }

  access_filter: {
    field: view_09817.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09817.is_deleted} = false ;;
}
