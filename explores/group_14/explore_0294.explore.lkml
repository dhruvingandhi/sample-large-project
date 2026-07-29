# Explore: explore_0294
# Auto-generated LookML Explore File

include: "/views/domain_33/view_00883.view.lkml"
include: "/views/domain_35/view_00885.view.lkml"
include: "/views/domain_36/view_00886.view.lkml"
include: "/views/domain_37/view_00887.view.lkml"

explore: explore_0294 {
  label: "Explore Explore 0294"
  description: "Comprehensive analytics explore joining base view_00883 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00883
  
  always_filter: {
    filters: [view_00883.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00883.created_at_date: "7 days"]
    unless: [view_00883.id, view_00883.status]
  }

  join: view_00885 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00883.user_id} = ${view_00885.id} ;;
    required_joins: []
  }

  join: view_00886 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00883.account_id} = ${view_00886.account_id} ;;
    required_joins: [view_00885]
  }

  join: view_00887 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00883.category} = ${view_00887.category} ;;
  }

  access_filter: {
    field: view_00883.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00883.is_deleted} = false ;;
}
