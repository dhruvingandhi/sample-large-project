# Explore: explore_1081
# Auto-generated LookML Explore File

include: "/views/domain_44/view_03244.view.lkml"
include: "/views/domain_46/view_03246.view.lkml"
include: "/views/domain_47/view_03247.view.lkml"
include: "/views/domain_48/view_03248.view.lkml"

explore: explore_1081 {
  label: "Explore Explore 1081"
  description: "Comprehensive analytics explore joining base view_03244 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03244
  
  always_filter: {
    filters: [view_03244.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03244.created_at_date: "7 days"]
    unless: [view_03244.id, view_03244.status]
  }

  join: view_03246 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03244.user_id} = ${view_03246.id} ;;
    required_joins: []
  }

  join: view_03247 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03244.account_id} = ${view_03247.account_id} ;;
    required_joins: [view_03246]
  }

  join: view_03248 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03244.category} = ${view_03248.category} ;;
  }

  access_filter: {
    field: view_03244.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03244.is_deleted} = false ;;
}
