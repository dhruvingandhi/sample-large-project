# Update for 2000 file diff target
# Explore: explore_3430
# Auto-generated LookML Explore File

include: "/views/domain_41/view_10291.view.lkml"
include: "/views/domain_43/view_10293.view.lkml"
include: "/views/domain_44/view_10294.view.lkml"
include: "/views/domain_45/view_10295.view.lkml"

explore: explore_3430 {
  label: "Explore Explore 3430"
  description: "Comprehensive analytics explore joining base view_10291 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10291
  
  always_filter: {
    filters: [view_10291.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10291.created_at_date: "7 days"]
    unless: [view_10291.id, view_10291.status]
  }

  join: view_10293 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10291.user_id} = ${view_10293.id} ;;
    required_joins: []
  }

  join: view_10294 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10291.account_id} = ${view_10294.account_id} ;;
    required_joins: [view_10293]
  }

  join: view_10295 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10291.category} = ${view_10295.category} ;;
  }

  access_filter: {
    field: view_10291.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10291.is_deleted} = false ;;
}
