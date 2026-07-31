# Update for 2000 file diff target
# Explore: explore_1690
# Auto-generated LookML Explore File

include: "/views/domain_21/view_05071.view.lkml"
include: "/views/domain_23/view_05073.view.lkml"
include: "/views/domain_24/view_05074.view.lkml"
include: "/views/domain_25/view_05075.view.lkml"

explore: explore_1690 {
  label: "Explore Explore 1690"
  description: "Comprehensive analytics explore joining base view_05071 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05071
  
  always_filter: {
    filters: [view_05071.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05071.created_at_date: "7 days"]
    unless: [view_05071.id, view_05071.status]
  }

  join: view_05073 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05071.user_id} = ${view_05073.id} ;;
    required_joins: []
  }

  join: view_05074 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05071.account_id} = ${view_05074.account_id} ;;
    required_joins: [view_05073]
  }

  join: view_05075 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05071.category} = ${view_05075.category} ;;
  }

  access_filter: {
    field: view_05071.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05071.is_deleted} = false ;;
}
