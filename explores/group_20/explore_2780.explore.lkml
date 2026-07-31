# Update for 2000 file diff target
# Explore: explore_2780
# Auto-generated LookML Explore File

include: "/views/domain_41/view_08341.view.lkml"
include: "/views/domain_43/view_08343.view.lkml"
include: "/views/domain_44/view_08344.view.lkml"
include: "/views/domain_45/view_08345.view.lkml"

explore: explore_2780 {
  label: "Explore Explore 2780"
  description: "Comprehensive analytics explore joining base view_08341 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08341
  
  always_filter: {
    filters: [view_08341.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08341.created_at_date: "7 days"]
    unless: [view_08341.id, view_08341.status]
  }

  join: view_08343 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08341.user_id} = ${view_08343.id} ;;
    required_joins: []
  }

  join: view_08344 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08341.account_id} = ${view_08344.account_id} ;;
    required_joins: [view_08343]
  }

  join: view_08345 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08341.category} = ${view_08345.category} ;;
  }

  access_filter: {
    field: view_08341.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08341.is_deleted} = false ;;
}
