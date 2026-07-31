# Update for 2000 file diff target
# Explore: explore_0690
# Auto-generated LookML Explore File

include: "/views/domain_21/view_02071.view.lkml"
include: "/views/domain_23/view_02073.view.lkml"
include: "/views/domain_24/view_02074.view.lkml"
include: "/views/domain_25/view_02075.view.lkml"

explore: explore_0690 {
  label: "Explore Explore 0690"
  description: "Comprehensive analytics explore joining base view_02071 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_02071
  
  always_filter: {
    filters: [view_02071.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02071.created_at_date: "7 days"]
    unless: [view_02071.id, view_02071.status]
  }

  join: view_02073 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02071.user_id} = ${view_02073.id} ;;
    required_joins: []
  }

  join: view_02074 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02071.account_id} = ${view_02074.account_id} ;;
    required_joins: [view_02073]
  }

  join: view_02075 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02071.category} = ${view_02075.category} ;;
  }

  access_filter: {
    field: view_02071.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02071.is_deleted} = false ;;
}
