# Explore: explore_3587
# Auto-generated LookML Explore File

include: "/views/domain_12/view_10762.view.lkml"
include: "/views/domain_14/view_10764.view.lkml"
include: "/views/domain_15/view_10765.view.lkml"
include: "/views/domain_16/view_10766.view.lkml"

explore: explore_3587 {
  label: "Explore Explore 3587"
  description: "Comprehensive analytics explore joining base view_10762 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10762
  
  always_filter: {
    filters: [view_10762.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10762.created_at_date: "7 days"]
    unless: [view_10762.id, view_10762.status]
  }

  join: view_10764 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10762.user_id} = ${view_10764.id} ;;
    required_joins: []
  }

  join: view_10765 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10762.account_id} = ${view_10765.account_id} ;;
    required_joins: [view_10764]
  }

  join: view_10766 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10762.category} = ${view_10766.category} ;;
  }

  access_filter: {
    field: view_10762.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10762.is_deleted} = false ;;
}
