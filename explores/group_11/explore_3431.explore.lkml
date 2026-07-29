# Explore: explore_3431
# Auto-generated LookML Explore File

include: "/views/domain_44/view_10294.view.lkml"
include: "/views/domain_46/view_10296.view.lkml"
include: "/views/domain_47/view_10297.view.lkml"
include: "/views/domain_48/view_10298.view.lkml"

explore: explore_3431 {
  label: "Explore Explore 3431"
  description: "Comprehensive analytics explore joining base view_10294 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_10294
  
  always_filter: {
    filters: [view_10294.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10294.created_at_date: "7 days"]
    unless: [view_10294.id, view_10294.status]
  }

  join: view_10296 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10294.user_id} = ${view_10296.id} ;;
    required_joins: []
  }

  join: view_10297 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10294.account_id} = ${view_10297.account_id} ;;
    required_joins: [view_10296]
  }

  join: view_10298 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10294.category} = ${view_10298.category} ;;
  }

  access_filter: {
    field: view_10294.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10294.is_deleted} = false ;;
}
