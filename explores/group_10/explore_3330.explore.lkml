# Explore: explore_3330
# Auto-generated LookML Explore File

include: "/views/domain_41/view_09991.view.lkml"
include: "/views/domain_43/view_09993.view.lkml"
include: "/views/domain_44/view_09994.view.lkml"
include: "/views/domain_45/view_09995.view.lkml"

explore: explore_3330 {
  label: "Explore Explore 3330"
  description: "Comprehensive analytics explore joining base view_09991 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09991
  
  always_filter: {
    filters: [view_09991.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09991.created_at_date: "7 days"]
    unless: [view_09991.id, view_09991.status]
  }

  join: view_09993 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09991.user_id} = ${view_09993.id} ;;
    required_joins: []
  }

  join: view_09994 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09991.account_id} = ${view_09994.account_id} ;;
    required_joins: [view_09993]
  }

  join: view_09995 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09991.category} = ${view_09995.category} ;;
  }

  access_filter: {
    field: view_09991.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09991.is_deleted} = false ;;
}
