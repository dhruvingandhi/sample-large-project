# Update for 2000 file diff target
# Explore: explore_1430
# Auto-generated LookML Explore File

include: "/views/domain_41/view_04291.view.lkml"
include: "/views/domain_43/view_04293.view.lkml"
include: "/views/domain_44/view_04294.view.lkml"
include: "/views/domain_45/view_04295.view.lkml"

explore: explore_1430 {
  label: "Explore Explore 1430"
  description: "Comprehensive analytics explore joining base view_04291 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_04291
  
  always_filter: {
    filters: [view_04291.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04291.created_at_date: "7 days"]
    unless: [view_04291.id, view_04291.status]
  }

  join: view_04293 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04291.user_id} = ${view_04293.id} ;;
    required_joins: []
  }

  join: view_04294 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04291.account_id} = ${view_04294.account_id} ;;
    required_joins: [view_04293]
  }

  join: view_04295 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04291.category} = ${view_04295.category} ;;
  }

  access_filter: {
    field: view_04291.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04291.is_deleted} = false ;;
}
