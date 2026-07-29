# Explore: explore_3739
# Auto-generated LookML Explore File

include: "/views/domain_18/view_11218.view.lkml"
include: "/views/domain_20/view_11220.view.lkml"
include: "/views/domain_21/view_11221.view.lkml"
include: "/views/domain_22/view_11222.view.lkml"

explore: explore_3739 {
  label: "Explore Explore 3739"
  description: "Comprehensive analytics explore joining base view_11218 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11218
  
  always_filter: {
    filters: [view_11218.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11218.created_at_date: "7 days"]
    unless: [view_11218.id, view_11218.status]
  }

  join: view_11220 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11218.user_id} = ${view_11220.id} ;;
    required_joins: []
  }

  join: view_11221 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11218.account_id} = ${view_11221.account_id} ;;
    required_joins: [view_11220]
  }

  join: view_11222 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11218.category} = ${view_11222.category} ;;
  }

  access_filter: {
    field: view_11218.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11218.is_deleted} = false ;;
}
