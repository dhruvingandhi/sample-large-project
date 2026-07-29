# Explore: explore_0880
# Auto-generated LookML Explore File

include: "/views/domain_41/view_02641.view.lkml"
include: "/views/domain_43/view_02643.view.lkml"
include: "/views/domain_44/view_02644.view.lkml"
include: "/views/domain_45/view_02645.view.lkml"

explore: explore_0880 {
  label: "Explore Explore 0880"
  description: "Comprehensive analytics explore joining base view_02641 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_02641
  
  always_filter: {
    filters: [view_02641.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02641.created_at_date: "7 days"]
    unless: [view_02641.id, view_02641.status]
  }

  join: view_02643 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02641.user_id} = ${view_02643.id} ;;
    required_joins: []
  }

  join: view_02644 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02641.account_id} = ${view_02644.account_id} ;;
    required_joins: [view_02643]
  }

  join: view_02645 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02641.category} = ${view_02645.category} ;;
  }

  access_filter: {
    field: view_02641.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02641.is_deleted} = false ;;
}
